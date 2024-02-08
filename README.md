# Global Packet Filtering Language

# The language
For example of filtering policy go to [example](./example/).
## Structure
This language is divided in two parts, the prologue and the filter.

### Prologue
The prologue contains the automatas définitions and the initialization sequence.

The initialization sequence can contains any statements but is used for three of them:
- `newAutomaton(name, id_automata)`, create a new instance of an already defined automata
- `set(variable, value)`, create or set a variable
- `newInterrupt(time, repeat, block)`, create an interruptions that will executed a block at a given time and potentially repeat every given time

### Filter
The filter will be called for every packet that is incoming in the system. The filtering policy will be desribe by a block of statements.

## Statements
- `cond(condition, block)`, execute a block of statements if the condition is true
- `iter(condition, block)`, iterate on a block of statements while the condition is true
- `step(id_automata, transition, block)`, fire a transition on a given instance of an automaton if possible, else execute the block of code
- `read(start, length)`, read length bytes starting from start
- `alarm(message)`, write an alarm in the console
- `send(port, packet)`, send a packet to a designed port
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
The input file wille be first argument of run configurations.  
The output file wille be second argument of run configurations.

## Ports
Ports are read from a text input file that play the role of the port oracle. It must be written this way:
```
inside_port -> output_file
```
one rule per line.  
The port oracle file will be the third argument of run configurations.

## Clock managment 
The clock is set at 0 while the filtering policy hasn't begun. Then it is updated with the time of each arriving packet.

## Interruptions
At every arriving packet the time is updated. Before handling the packet the intterruptions are executed if needed.