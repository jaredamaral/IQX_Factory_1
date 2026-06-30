# PROPOSED/ — Staged changes (Gate 5B)

Agent 26 (offering-updater) writes proposed changes to canonical artifacts here
as mirrored file paths — it never silently mutates live files. The user reviews
the diff (Gate 5B) and either:

- **Approve** → move file(s) to their live location, commit, add an
  `UPDATES-LOG.md` entry, mark the inbox item accepted; or
- **Reject** → delete from `PROPOSED/`, mark the inbox item rejected.

Structure mirrors the offering root, e.g.
`PROPOSED/agent-outputs/use-case-architect/use-case-library.md`.
