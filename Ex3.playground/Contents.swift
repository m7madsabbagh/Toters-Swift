enum AuthenticationError: Error
{
    case emptyFields
    case passwordTooShort
    case invalidUsername
    case userNotFound
    case incorrectPassword
    case maxAttemptsReached
}

struct UserAuthenticator
{
    let validUsers = [
        "alice123": "p@ssw0rd",
        "bob_2024": "b0bby!9",
        "charlie": "Secure*123"
                    ]

    var attempts = 0
    var maxAttempts = 3

    mutating func login(username: String, password: String) throws -> Bool
    {
        if attempts >= maxAttempts
        {
            throw AuthenticationError.maxAttemptsReached
        }

        if username.isEmpty || password.isEmpty
        {
            attempts += 1
            throw AuthenticationError.emptyFields
        }

        if password.count < 8
        {
            attempts += 1
            throw AuthenticationError.passwordTooShort
        }

        let isValidUsername = username.range(of: "^[a-zA-Z0-9_]+$", options: .regularExpression) != nil
        if !isValidUsername
        {
            attempts += 1
            throw AuthenticationError.invalidUsername
        }

        guard let storedPasswords = validUsers[username] else
        {
            attempts += 1
            throw AuthenticationError.userNotFound
        }

        if storedPasswords != password
        {
            attempts += 1
            throw AuthenticationError.incorrectPassword
        }

        return true
    }
}

var authenticator = UserAuthenticator()

do
{
    let success = try authenticator.login(username: "alice123", password: "p@ssw0rd")
    print("login successful")
}
    catch
{
    print("error")
}
