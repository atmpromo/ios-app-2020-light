//
//  AuthIntegration+Apple.swift
//  AroundTheMetro
//
//  Created by Artem Alexandrov on 19.09.2020.
//  Copyright © 2020 AugmentedDiscovery. All rights reserved.
//

import Firebase

extension AuthIntegration {
    func appleSignIn(with idTokenString: String,
                     nonce: String,
                     completion: ((Result<AuthUserInfo?, AuthError>) -> Void)?) {
        // Initialize a Apple credential.
        let credential = OAuthProvider.credential(withProviderID: "apple.com",
                                                  idToken: idTokenString,
                                                  rawNonce: nonce)
        // Sign in with Apple.
        login(with: credential, completion: completion)
    }
}