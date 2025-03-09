# Compiler and flags
CC = gcc
CFLAGS = `pkg-config --cflags gtk+-3.0`
LDFLAGS = `pkg-config --libs gtk+-3.0`

# Source and executable files
SRC = BlueSunLinux-Toolbox.c
EXEC = BlueSunLinux-Toolbox

# Build rule
$(EXEC): $(SRC)
	$(CC) $(CFLAGS) $(SRC) -o $(EXEC) $(LDFLAGS)

# Clean rule
clean:
	rm -f $(EXEC)

# Run rule
run: $(EXEC)
	./$(EXEC)

# Default rule
all: $(EXEC)