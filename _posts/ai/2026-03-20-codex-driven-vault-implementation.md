---
title: "FerrumVault: The Password Manager Codex Built for Me"
description: "How an autonomous AI engineer turned my dream vault app into a cross-platform, security-obsessed reality with PBKDF2 hardening and Google Drive sync."
author: "Satishkumar Venkatasamy"
date: "2026-03-20"
tags: [AgenticAI, PasswordManager, Security, Rust, Tauri, Codex, GoogleDrive, PBKDF2]
---

# FerrumVault: When AI Builds a Security-Focused App from Scratch

FerrumVault lived on my wishlist for years. I knew exactly how it should behave—every credential neatly tagged, foldered, categorized so I could search by app name, description, folder, tag, or any snippet of context. I sketched the crypto, the UX, the Google Drive backups. But as an IAM leader, I never had the runway to code a full product.

![FerrumVault login screen with profile picker](/assets/img/posts/ai/001-LoginScreenNew.png)

Enter Codex, OpenAI’s autonomous coding agent. I handed it the vision and guardrails, then watched it build FerrumVault from the ground up—no human commits required. The wild part? It went beyond my spec. I never asked for “profiles,” yet Codex invented them anyway, letting me compartmentalize work, personal, and finance vaults while giving testers clean sandboxes. That’s the magic of agentic tools: they don’t just follow orders; they see around corners. And because Codex targeted a Tauri desktop shell, the entire experience runs identically on macOS, Windows, and Linux.

## What FerrumVault Delivers

- **Full-stack build-out** – Codex authored the CLI, vault engine, sharded SQLite layer, Tauri desktop shell, and UI workflows autonomously.
- **Serious crypto** – Master passwords run through PBKDF2 with 10,000 iterations to derive a Master Encryption Key that wraps every per-credential Data Encryption Key. Shards are AES-GCM–encrypted and authenticated before touching disk.
- **Defense-in-depth** – Session timers gate edits, password history entries rewrap under the MEK, and tamper plays (metadata flips, shard swaps, bundle replays) trigger hard fails.
- **Seamless backups** – FerrumVault zips every vault file, encrypts the bundle with a random DEK, and pushes/restores snapshots via a PKCE-secured Google Drive integration, complete with revision tracking to block silent rollbacks.
- **Deterministic fixtures** – Every fresh profile seeds realistic data (Stacy Bank PIN, SlushingFoxes OAuth token) so unlock flows can be tested immediately.
- **Observability** – `tauri-debug.log`, session metrics, and sync manifests capture each invoke for pen-testing and forensics.
- **Cross-platform parity** – The Tauri desktop shell ships the same features and UX across macOS, Windows, and Linux—no compromises.

![FerrumVault main dashboard](/assets/img/posts/ai/003-FerrumVaultMainPage.png)

## Why It Matters

FerrumVault proves autonomous engineering is here. Codex behaved like a full-stack team—threat modeling, pen-testing, tightening logs, validating DEK rotation, wiring Drive APIs, polishing UX, inventing profiles, and shipping cross-platform binaries. The result mirrors the product I dreamed up on a whiteboard, only faster and more capable.

Pair human vision with AI execution and “someday” projects stop gathering dust. FerrumVault isn’t just another password manager; it’s proof that agentic coding tools can elevate your idea, surprise you with smart additions, and deliver production-grade software on every desktop OS—no nights or weekends required.

![Google Drive backup workflow](/assets/img/posts/ai/011-BackupToGoogleDrive.png)

## Try It

- GitHub Repo: https://github.com/satishkumarvenkatasamy/ferrumvault-public
- User Guide: https://github.com/satishkumarvenkatasamy/ferrumvault-public/blob/main/docs/user-guide.md

Ready to see what Codex can do for your backlog dream? FerrumVault is living proof that the right agent can turn “one day” into “done.”
