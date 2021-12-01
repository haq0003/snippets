1/ Remove if exist ./node_module because we are going to rebuild it

2/ install first node/npm in vendor 
```
composer require mouf/nodejs-installer
```

3/ in package.json add : 
```
   "dependencies": {
        "node": "^14.18.0",
        "node-gyp": "^8.4.1",
        "npm": "^7.20.1",
        "yarn": "^1.22.15",
```

4/ Run with npm from vendor just once :
```
./vendor/mouf/nodejs-installer/bin/global/npm install
```

5/ in ~/.bash_profile add, check path : 
```
alias node="./node_modules/.bin/node"
alias npm="./node_modules/.bin/npm"
alias yarn="./node_modules/.bin/yarn"
alias node-gyp="./node_modules/.bin/node-gyp"
```

6/ We could compile, check scripts in packages.json  : 
```
npm run dev
npm run build
npm run dev
npm watch
```


If error with node-sass : 

Found bindings for the following environments:
  - Linux 64-bit with Unsupported runtime (93)

npm install node-sass
node node_modules/node-sass/scripts/install.js
