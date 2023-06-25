module.exports = {
    "env": {
        "browser": true,
        "es2021": true,
    },
    "extends": "google",
    "overrides": [
        {
            "env": {
                "node": true,
            },
            "files": [
                ".eslintrc.{js,cjs}",
            ],
            "parserOptions": {
                "sourceType": "script",
            },
        },
    ],
    "parserOptions": {
        "ecmaVersion": "latest",
        "sourceType": "module",
    },
    "rules": {
        "quotes": ["error", "double"],
        "indent": ["error", 4, {SwitchCase: 1}],
        "max-len": ["error", {
            "code": 120, // Maximum line length in characters
            "tabWidth": 4, // Number of spaces equivalent to a tab
            "ignoreComments": false, // Do not ignore comments when checking line length
            "ignoreTrailingComments": true, // Ignore trailing comments when checking line length
            "ignoreUrls": true, // Ignore URLs when checking line length
            "ignoreStrings": true, // Ignore strings when checking line length
            "ignoreTemplateLiterals": true, // Ignore template literals when checking line length
            "ignoreRegExpLiterals": true, // Ignore regular expression literals when checking line length
            "ignorePattern": "^import\\s.+\\sfrom\\s.+;$", // Ignore import statements from line length check
        }],
    },
};
