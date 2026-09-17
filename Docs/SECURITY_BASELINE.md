# HELPORA Security Baseline

This repository is a native iOS client. Items that require a server are documented here and must be enforced on the server, not trusted to the app.

## Client protections

1. Secrets: no API keys, private keys, passwords, or production credentials in source. Local secret files are ignored by Git.
2. Local secrets: credentials belong in Keychain with device-only accessibility.
3. Input limits: user-generated title, details, bio, name, and city are normalized and length-bounded before persistence or upload.
4. Network: production API endpoints must use HTTPS only. Reject plain HTTP URLs.
5. Logs: never log authentication tokens, passwords, message contents, or precise location.
6. Error messages: show users short, actionable messages; keep internal diagnostics out of UI.
7. Uploads: server must enforce file count, MIME type, byte size, image dimensions, and malware/content checks.
8. Web content: if a web companion is added, render untrusted content as text and apply output encoding and a strict Content Security Policy.

## Server-side protections required before production

9. Authorization: every read/write operation must be authorized server-side for the authenticated user and resource.
10. Authentication: rate-limit login, password-reset, verification, and token endpoints; use progressive throttling and abuse detection.
11. Passwords: passwords are never stored by the iOS client. If HELPORA operates its own authentication service, store passwords only with a modern adaptive password-hashing scheme and unique salts.
12. Database: use parameterized queries or a safe ORM; never concatenate user input into SQL.
13. CORS: allow only explicitly required production origins. Do not use a wildcard origin with credentials.
14. Security headers: the web companion should send HSTS, Content-Security-Policy, frame/embedding restrictions, MIME-sniffing protection, and an appropriate Referrer-Policy.
15. Webhooks: verify signatures server-side using the provider's documented signing algorithm, timestamp/replay checks, and constant-time comparison.
16. Admin: use server-side RBAC with least privilege, MFA for privileged accounts, audit logs, and separate admin sessions.
17. Dependencies: pin production dependency versions where appropriate and run automated vulnerability/license checks in CI.
18. Backups: encrypted, access-controlled backups with restore tests and a documented retention policy.
19. Account deletion: provide a verified deletion flow and remove or anonymize associated personal data according to the published retention policy and applicable law.
20. Spending controls: alert on unusual API/cloud spend and enforce hard server-side usage limits.
21. Abuse controls: implement request throttling, validation, anti-automation controls where appropriate, and server-side business-rule enforcement.
22. Testing: before launch, run automated tests, dependency scanning, authorization tests, and an independent security review appropriate to the product's risk.
23. Secrets rotation: if a secret is ever exposed, revoke and rotate it immediately; removing it from the current file alone does not remove it from Git history.

## Important architecture rule

The iOS app is an untrusted client. Cooldowns, meeting permissions, trust scores, admin roles, spending limits, and other business rules must be re-checked by the backend in production. Local SwiftUI logic is for the prototype and offline UI only.
