# bfi

**bfi** is an amalgamation of an interpreter and an ahead-of-time (AOT) compiler for the esoteric programming language **Brainfuck**.

Brainfuck is a deliberately minimal language consisting of only **eight commands**, yet it is Turing complete.
`bfi` can interpret Brainfuck programs directly, compile them into native executables, or emit equivalent C source code.

For more information about the BrainFuck, see:
https://en.wikipedia.org/wiki/Brainfuck


## Installation

```sh
curl -fsSL https://raw.githubusercontent.com/pixelatedseraph/bfi/main/install.sh | sh
```

## Requirements
Since bfi transpiles to C code, a C compiler is expected to be installed in your system
GCC,Clang,MSVC,TCC and other standard compliant C compilers are supported


## Usage

```text
bfi <operation> <file>
```

### Operations

| Operation | Description |
|-----------|-------------|
| `run` | Interpret and execute a Brainfuck program |
| `compile` | Compile a Brainfuck program into a native executable |
| `dump` | Emit equivalent C source code |

### Examples

Run a program:

```sh
bfi run hello.bf
```

Compile a program:

```sh
bfi compile hello.bf
```
