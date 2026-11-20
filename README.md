# Useless.Bash
A few useless Bash scripts.

---

## Release

`0.7.1`
| [GitHub](https://github.com/stanuseless/Useless.Bash/releases/tag/0.7.1)
| [Key](https://stanuseless.github.io/src/main/res/stanuseless_release.pub)

### Build and Install

```
./assemble.sh --build_variant 'release' \
 && ./src/test/bash/checks.sh --build_variant 'release' \
 && mkdir '/opt/Useless.Bash-0.7.1/' \
 && tar -xf './build/tar/Useless.Bash-0.7.1.tar.gz' -C '/opt/Useless.Bash-0.7.1/'
```

### Download and Install

```
TMP_PATH="$(mktemp)" \
 && curl -m 32 -f -L 'https://github.com/stanuseless/Useless.Bash/releases/download/0.7.1/Useless.Bash-0.7.1.tar.gz' -o "${TMP_PATH}" \
 && mkdir '/opt/Useless.Bash-0.7.1/' \
 && tar -xf "${TMP_PATH}" -C '/opt/Useless.Bash-0.7.1/' && rm "${TMP_PATH}"
```

---

## Unstable

`0.7.0-UNSTABLE`
| [GitHub](https://github.com/stanuseless/Useless.Bash/releases/tag/0.7.0-UNSTABLE)
| [Key](https://stanuseless.github.io/src/main/res/stanuseless_debug.pub)

### Build and Install

```
./assemble.sh --build_variant 'unstable' \
 && ./src/test/bash/checks.sh --build_variant 'unstable' \
 && mkdir '/opt/Useless.Bash-0.7.0-UNSTABLE/' \
 && tar -xf './build/tar/Useless.Bash-0.7.0-UNSTABLE.tar.gz' -C '/opt/Useless.Bash-0.7.0-UNSTABLE/'
```

### Download and Install

```
TMP_PATH="$(mktemp)" \
 && curl -m 32 -f -L 'https://github.com/stanuseless/Useless.Bash/releases/download/0.7.0-UNSTABLE/Useless.Bash-0.7.0-UNSTABLE.tar.gz' -o "${TMP_PATH}" \
 && mkdir '/opt/Useless.Bash-0.7.0-UNSTABLE/' \
 && tar -xf "${TMP_PATH}" -C '/opt/Useless.Bash-0.7.0-UNSTABLE/' && rm "${TMP_PATH}"
```

---
