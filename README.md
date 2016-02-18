# TSN3251 Computer Security Assignment

Below are the guide for setting up ruby on linux machine and running a ruby program. Note that everything is done in terminal.

### Setting up ruby
1. Install ruby: 
```sudo apt-get install ruby-full```

2. Change the current directory to CS-Assignment. If you have already, skip this.

```cd CS-Assignment```

3. Run bundler: 
```bundle install```

### Running the sytem in interactive mode

To run Encyption System in `interactive` mode, run the following code. 

```ruby q3.rb -i ```

### Running the system in non-interactive mode

##### Help command

```ruby q3.rb -h```

##### Example command
```ruby q3.rb -n abc -e krkr```

Above command will read input from file with name abc and will run key, railfence, key , railfence cipher on the input in that order

##### Command legend
```
   -i, --[no-]interactive           turn on interactive mode
   
   -e, --encryption-method          defines what encryption and in what order [ k - key cipher ] [ r - railfence ]
   
   -n, --input-filename             input file to process
   
   -o, --output-filename            output file for encrpyted
   
   -r, --rf-key 123                 key for railfence
   
   -k, --ky-key kappa               key for key cipher
   
   -t, --text                       text to encrypt
   
   -h, --help                       Show this message
   
   -v, --version                    Print version
```
