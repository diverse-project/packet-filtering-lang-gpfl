# Global Packet Filtering Language

$GPFL$ is a language  that allows to express policies that accept or drop packets at the entry of a network depending on generic conditions related to the packet content or external information.

The model is in [plugins/model](./plugins/fr.inria.diverse.gpfl.model/model/gpfl_class_diagram.jpg).  
For example of filtering policy go to [example](./example/).

## Language
Terminals are shown in bold font and nonterminals in italics. Literal characters are given in single quotes. Parentheses `(` and `)` indicate grouping when needed. Square brackets `[` and `]` enclose optional items. Vertical bars `|` separate alternatives.

||||
|-|-|-|
|policy|:|[*prologue*] [*filter*]|
|prologue|:|**'PROLOGUE'** *automata* [*init_seq*]|
|automata|:|**'AUTOMATA'** *STRING* **'init'** **'='** *STRING* [*transition*] [*automata*]|
|init_seq|:|**'INIT'** *block*|
|filter|:|**'FILTER'** *block*|
|transition|:|*STRING* **'-'** *STRING* **'->'** *STRING* [*transition*]|
|block|:|*stmt* [*block*]|
|stmt|:|*cmd*|
||\||**'cond'** **'('** *expression* **','** *block* **')'**|
||\||**'iter'** **'('** *expression* **','** *block* **')'**|
||\||**'newInterrupt'** **'('** *INT* **','** *BOOLEAN* **','** *block* **')'**|
||\||**'step'** **'('** *AUTOMATA_ID* **','** *ID* **','** *block* **')'**|
|cmd|:|**'nop'**|
||\||**'accept'**|
||\||**'drop'**|
||\||**'send'** **'('** *PORT_ID* **','** *packet* **')'**|
||\||**'alarm'** **'('** [*STRING*] **','** *STRING* **')'**|
||\||**'set'** **'('** *ID* **','** *expression* **')'**|
||\||**'newAutomaton'** **'('** *STRING* **','** *AUTOMATA_ID* **')'**|
||\||**'newEventOccurence'** **'('** *ID* **','** *ID* **')'**|
|packet|:|**'('** *BYTES* **')'**|
||\||**'('** *HEXA* **')'**|

### Variables and IDs

Each variables that can be of type `STRING`, `BOOLEAN`, `INT` or `BYTES` is designated by an `ID`.
An `ID` is represented by any string of alphabetic (`[a-zA-Z]`) characters, underscores (`'_'`) or digits(`[0-9]`), not beginning with a digit.

There is two specifics IDs:
- `AUTOMATA_ID`, that is manually assigned to a predefined automaton and represented by an `#` followed by an `ID`;
- `PORT_ID`, that is automatically defined when the program is plugged on a system and represented by the letter `p` followed by an `ID`.

### Automata

A policy can start with the declaration of one or many automata with its states, initial state and transitions.
```
AUTOMATA "DHCP incoming controller"
    init = "0"
    "0" -"Disc"-> "1" 
    "1" -"Req"-> "2" 
    "1" -"Rej"-> "2" 
    "2" -"Ack"-> "0" 
    "0" -"Rel"-> "3"
    "3" -"Ack"-> "0"
```
Once an automaton is declared it has to be instantiated with the command `newAutomaton`.
```
newAutomaton("DHCP incoming controller", #A)
```
An automaton can have multiple instantiations.

In term of manipulation of an instance of an automaton, it is possible to fire a transition thanks to the command `step` that will fire a transition on a given automaton if the transition exist.
```
step(#A, Disc, 
    // <block>
) 
```
If the transition is fired, the block is executed, else nothing happens.
The second argument of a `step` command is of type `Event`. Each transition has an `Event` that is implicitly created during the instantiation of an automaton. But an `Event` can also be created explicitly thanks to the command `newEventOccurence` when the transition to fire depends on a condition:
```
cond (read(0, 4) == 0b0010,newEventOccurence(evt,Req))
cond (read(0, 4) == 0b0011,newEventOccurence(evt,Rej)) 
step(#A, evt, 
    // <block>
) 
```

### Statements and Commands
A block is composed of:
- Statements, that contains themselves a block:
  - `cond(if:BOOLEAN, then:block)`, execute a block if the condition is true;
  - `iter(while:BOOLEAN, then:block)`, iterate on a block while the condition is true;
  - `newInterrupt(time:INT, repeat:BOOLEAN, block:block)`, create an interruptions that will executed a block at a given time and repeat every given time if repeat is true;
  - `step(id:AUTOMATA_ID, transition:tranistion, block:block)`, fire a transition on a given instance of an automaton if possible, else execute the block of code (as seen in part [Automata](#automata)).
- Commands:
  - `nop`, does nothing, is used when a statements needs a block but there is nothing to do;
  - `accept`, accept the current packet and stop the current filtering policy;
  - `drop`, drop the current packet and stop the current filtering policy;
  - `send(id:PORT_ID, packet:packet)`, send a packet to a designed port;
  - `alarm(type:STRING, text:STRING)`, write the text in the console, type is mandatory and allow to specify if the alarm is an error message or not;
  - `set(declaration:ID, value:expression)`, declare a variable of the same type as the value;
  - `newAutomaton(value:STRING, id:AUTOMATA_ID)`, create an instance of an automaton designated by its name from its declaration (as seen in part [Automata](#automata));
  - `newEventOccurence(id:ID, value:ID)`, create a new occurrence for an event with a specific id (as seen in part [Automata](#automata)).

### Expressions

Expressions are too numerous to be listed in the grammar. They include all the basics operators like or(`|`), and (`&`), equality (`==`), inequality (`!=`), greater or equal (`>=`), lower or equal (`<=`), greater (`>`), lower (`<`), plus (`+`), minus (`-`), multiplication (`*`), division (`/`), not (`!`), negation (`--`).

Literals of type `INT`, `STRING`, `BOOLEAN`, `BYTES` (written following the pattern `"0b"("0" | "1")+`), `HEXA` (written following the pattern `"0x" ('0'..'9'|'a'..'f'|'A'..'F')*`), as well as variable ID can be manipulated by operators.

There is three extra operators that are specific to $GPFL$:
- An operator for ports id comparison (`_port==`);
- An operator for side comparison (`_side_==`);
- An operator to read a sequence of bits from a packet (`read(offset:expression, length:expression)`)

## Simulator
The simulator use three configurations file to emulate the incoming packets, outgoing packets and the configuration of the port on the transit router.
It also simulate the clock of a transit router.

### Packets
The flow of packet is simulated thanks to a yaml file named `input-dataset.yaml` that described the properties of each packets arriving on the transit router. Each packet is described by three fields:
- `time` the time it arrived in the transit router
- `port` the port by which it arrived
- `content` it's content as a string of bits
It takes this format:
```
---
time: 2
port: 80
content: 00001010
```

### Ports
Ports are created from a yaml configuration file named `ports_config.yaml`. A transit router is composed of two sides, the inside of the local network and the outside. Each side is composed of ports that transmit packets to another specific port if the packet is accepted. In the configuration file a port is designated by:
- `number` its number 
- `port` the port where it will redirect packet if accepted
- `side` the side on which the port is physically on the transit router
It takes this format:
```
---
number: 80
out: 40
side: inside
```

### Clock management 
To simulate the clock, packets are defined with their arrival time. Before the start of the simulation the is set to 0, it is then updated with the arrival of each packets.

### Interruptions
At every arriving packet the time is updated. Before handling the packet the interruptions are executed if needed.

## Tooling

- interpretor/simulator
- debugger (WIP)
- syntax highlighting 
- auto completion
- validation
  - no outgoing transition form the initial state of an automaton
  - empty name for an automaton
  - interruption with a time < 1
  - interruption with only a `nop` to execute
  - presence of a `accept`, `drop` or `nop` in the initialisation sequence
  - filter starting with an `accept` or a `drop`
  - comparison of constants 
  - boolean used in calculus
- formatting (WIP)
