# Global Packet Filtering Language

# The language
For example of filtering policy go to [example](./example/).
## Structure
This language is divided in two parts, the prologue and the filter.

### Prologue
The prologue contains the automatas définitions and the initialization sequence.

The initialization sequence can contains any statements but is used for three of them:
- `newAutomaton()`, create a new instance of an already defined automata
- `set()`, create or set a variable
- `newInterrupt()`, create an interruptions that will executed at a given time

### Filter
The filter will be called for every packet that is incoming in the system. The filtering policy will be desribe by a block of statements.

## Statements
- `cond()`, execute a block of statements if the condition is true
- `iter()`, iterate on a block of statements while the condition is true
- `step()`, fire a transition on a given instance of an automaton if possible, else execute the block of code
- `alarm()`, write an alarm in the console
- `send()`, send a packet to a designed port
- `accept`, accept the current packet and stop the current filtering policy
- `drop`, drop the current packet and stop the current filtering policy
- `nop`, does nothing

## Expressions

# The simulator
## Packets
Packets are read from a text input file and the accepted one are written in a text output file.
Each line of the file corresponds to a packet and has this form:
```
(time;port;packet_binary)
```
The input file is the first argument of run configurations.
The output file is the second argument of run configurations.

## Clock managment 
The clock is set at 0 while the filtering policy hasn't begun. Then it is updated with the time of each arriving packet.

## Interruptions
At every arriving packet the time is updated. Before handling the packet the intterruptions are executed if needed.
