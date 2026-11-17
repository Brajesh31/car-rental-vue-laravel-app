# 🖼️ Image Upload and Asset Handling

## Upload validation
Validate allowed MIME types using server-side inspection, file size, dimensions where relevant and image decoding. Do not trust the filename or browser Content-Type.

## Storage
Use generated filenames. Keep originals outside executable paths. Prefer private storage for non-public files and a controlled public disk for approved vehicle images. Never allow user-provided paths.

## Delivery
Use configured storage URLs rather than hard-coded localhost URLs. Add a safe fallback image and meaningful alt text.

## Operations
Document storage permissions, backup coverage, orphan cleanup and CDN invalidation if a CDN is introduced.

## Security tests
Reject executable files, spoofed MIME types, oversized files, path traversal attempts and unauthorized uploads. Confirm public images cannot expose private documents.
