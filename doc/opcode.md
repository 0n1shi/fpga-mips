# Opcodes and functions

## Type

### type R

|name|bit|description|
|-|-|-|
|opcode|31-26|opcode
|rs|25-21|source register|
|rt|20-16|target register|
|rd|15-11|destination register|
|sa|10-6|shift register|
|function|5-0|function|


### type I

|name|bit|description|
|-|-|-|
|opcode|31-26|opcode|
|rs|25-21|source register|
|rt|20-16|target register|
|imm|15-0|immediate value|

### type J

|name|bit|description|
|-|-|-|
|opcode|31-26|opcode|
|target|25-0|address to jump to|

## Implemented instructions

|name|desc|implemeneted|
|-|-|-|
|addiu|rt = rs + imm|done|
|addu|rd = rs + rt;|done|
|bne|if (rs != rt) pc += offset * 4|done|
|j|pc = pc_upper | (target << 2)|done|
|jal|r31 = pc; pc = target << 2|done|
|or|rd = rs \| rt|done|
|jr|pc = rs||
|lw|rt = \*(int\*)(offset + rs)|done|
|sw|\*(int\*)(offset + rs) = rt|done|