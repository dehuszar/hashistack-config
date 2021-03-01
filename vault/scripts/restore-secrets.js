// This script will allow you to batch import secrets in json format.  The expectation is that your
// secrets will live in an object with the path as key and secret as value
// (which is what the retrieve-secrets.js script produces)

import got from 'got';
import fs from 'fs'

const BACKUP = JSON.parse(
  fs.readFileSync(`./vault/scripts/${
    process.argv.find(a => a.includes("--backup=")).replace('--backup=', '')
  }`, 'utf-8')
);

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

const method = 'POST';

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

(async () => {
  try {
    for await (let [path,data] of Object.entries(BACKUP)) {
      const url = `${VAULT_ADDR}${path}`;
      const response = await got(url, {
        ...options,
        json: {
          "options": {
            "cas": 1
          },
          data
        },
        responseType: 'json'
      });
      console.log(response);
    }
  } catch (error) {
  console.error
}
})();