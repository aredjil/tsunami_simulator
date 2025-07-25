# Makefile for tsunami simulation

FC = gfortran
FFLAGS = -O3 -std=f2008
SRC = main.f90
EXEC = main.x

all: $(EXEC)

$(EXEC): $(SRC)
	$(FC) $(FFLAGS) -o $(EXEC) $(SRC)

clean:
	rm -f $(EXEC)
