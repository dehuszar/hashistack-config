// WARNING :: Unless your cluster has reached a really bad state and can not be remediated, you probably don't want to use this script
// This script was written to crawl all the secrets in my cluster after the PKI infrastructure exploded to such a giant memory footprint
// my servers because inaccessible to all but the most basic requests.  ...that's when you want to use this.  It will save all your secrets
// on the requesting client in plain-text.  You have been warned.

import got from 'got';
import fs from 'fs'

const {
  VAULT_ADDR,
  VAULT_CACERT,
  VAULT_CLIENT_CERT,
  VAULT_CLIENT_KEY,
  VAULT_TOKEN
} = process.env;

const certificateAuthority = fs.readFileSync(VAULT_CACERT, 'utf-8');
const certificate = fs.readFileSync(VAULT_CLIENT_CERT, 'utf-8');
const key = fs.readFileSync(VAULT_CLIENT_KEY, 'utf-8');
const headers = {
  'Content-Type': 'application/json',
  'X-Vault-Token': VAULT_TOKEN
}

const method = 'LIST';

const secrets = {};
const url = VAULT_ADDR;
const basePath = '/v1/secret';
const options = {
  headers,
  https: {
    certificateAuthority,
    certificate,
    key,
    rejectUnauthorized: false
  },
  method,
};

const getValues = async (values, currentPath="") => {
  console.log(values)
  for await (let v of values) {
    const path = `/data/${currentPath}${v}`;
    const value = await got(`${url}${basePath}${path}`, {
      ...options,
      method: 'GET'
    });
    const { data: secret } = JSON.parse(value.body).data
    secrets[`${basePath}${path}`] = secret;
  }
}

const getSubPaths = async (paths, currentPath="") => {
  for await (let p of paths) {
    const {body} = await got(`${url}${basePath}/metadata/${currentPath}${p}`, options);
    const { keys } = JSON.parse(body).data;
    const values = keys.filter(k => !k.endsWith('/'))
    const subPaths = keys.filter(k => k.endsWith('/'))
    if (values.length > 0) { await getValues(values, `${currentPath}${p}`); }
    if (subPaths.length > 0) { await getSubPaths(subPaths, `${currentPath}${p}`); }
    console.log(`values: ${values}\nsubPaths: ${subPaths}`)
  }
}

(async () => {
  try {
    const {body} = await got(`${url}${basePath}/metadata/`, options);
    const { keys } = JSON.parse(body).data;
    for await (let k of keys) {
      const values = keys.filter(k => !k.endsWith('/'));
      if(values.length > 0) await getValues(values);
      const subPaths = keys.filter(k => k.endsWith('/'));
      if (subPaths.length > 0) await getSubPaths(subPaths);
      console.log(`values: ${values}\nsubPaths: ${subPaths}`)
    }
    console.log(secrets);
    fs.writeFileSync(`./${new Date().toISOString()}-secrets-backup.json`, JSON.stringify(secrets), 'utf-8')
  } catch (error) {
    console.error
  }
})();