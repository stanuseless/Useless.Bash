# Useless.Bash
A few useless Bash scripts.

---

## Release

`0.4.0`
| [GitHub](https://github.com/stanuseless/Useless.Bash/releases/tag/0.4.0)
| [Key](https://stanuseless.github.io/release-public.pem)

### Build and Install

```
$ ./assemble.sh \
 && ./src/test/bash/unit_test.sh \
 && unzip -d /opt/Useless.Bash-0.4.0 ./build/zip/Useless.Bash-0.4.0.zip
```

### Download and Install

```
$ TMP_PATH="$(mktemp)"; \
 curl -L 'https://github.com/stanuseless/Useless.Bash/releases/download/0.4.0/Useless.Bash-0.4.0.zip' \
  -o "${TMP_PATH}" && unzip -d /opt/Useless.Bash-0.4.0 "${TMP_PATH}" && rm "${TMP_PATH}"
```

---

## Unstable

`0.5.0-UNSTABLE`
| [GitHub](https://github.com/stanuseless/Useless.Bash/releases/tag/0.5.0-UNSTABLE)
| [Key](https://stanuseless.github.io/debug-public.pem)

### Build and Install

```
$ ./assemble.sh 'unstable' \
 && ./src/test/bash/checks.sh 'unstable' \
 && unzip -d /opt/Useless.Bash-0.5.0-UNSTABLE ./build/zip/Useless.Bash-0.5.0-UNSTABLE.zip
```

### Download and Install

```
$ TMP_PATH="$(mktemp)"; \
 curl -L 'https://github.com/stanuseless/Useless.Bash/releases/download/0.5.0-UNSTABLE/Useless.Bash-0.5.0-UNSTABLE.zip' \
  -o "${TMP_PATH}" && unzip -d /opt/Useless.Bash-0.5.0-UNSTABLE "${TMP_PATH}" && rm "${TMP_PATH}"
```

---
