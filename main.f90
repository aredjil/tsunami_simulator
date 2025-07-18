program tsunami
implicit none 

integer:: i, n 
integer, parameter :: grid_size = 100
integer, parameter:: num_time_steps = 10


real, parameter :: dt =1., dx=1., c=1. 

real, dimension(grid_size):: h, dh

integer, parameter:: icenter = 25 
real, parameter:: decay = 0.02 

do  concurrent (i=1:grid_size)
    h(i) = exp(-decay * (i - icenter) ** 2)
end do 

! Starting the time loop 

time_loop: do n = 1, num_time_steps
    dh(1) = h(1) -h(grid_size)
    do i = 2, grid_size
        dh(i) = h(i) - h(i-1)
    end do
    
    do i = 1, grid_size
        h(i) = h(i) - c * dh(i) / dx * dt 
    end do 
    print *, n, h
end do time_loop







end program tsunami 