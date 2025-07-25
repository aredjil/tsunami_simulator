program tsunami
implicit none 

integer:: i, n 
integer, parameter :: grid_size = 100
integer, parameter:: num_time_steps = 100


real, parameter :: dt =1., dx=1., c=1. 

real, dimension(grid_size):: h, dh

integer, parameter:: icenter = 25 
real, parameter:: decay = 0.02 

! do  concurrent (i=1:grid_size)
!     h(i) = exp(-decay * (i - icenter) ** 2)
! end do 
call set_gausian(h, icenter, decay)

! Starting the time loop 

time_loop: do n = 1, num_time_steps
    ! dh(1) = h(1) - h(grid_size)
    dh = diff(h)
    do i = 2, grid_size
        ! dh(i) = h(i) - h(i-1)
    end do
    
    do i = 1, grid_size
        h(i) = h(i) - c *dh(i) / dx * dt 
    end do 
    print *, n, h
end do time_loop


contains 

function diff(x) result(dx)
    implicit none
! This function computes the finite difference of an array ?
    real, intent(in) :: x(:)
    real:: dx(size(x))
    integer :: im 
    im = size(x)
    dx(1) = x(1) - x(im)
    dx(2:im) = x(2:im) - x(1:im-1)
end function diff

subroutine set_gausian(x, icenter, decay)
    implicit none 
    real, intent(in out) :: x(:)
    integer, intent(in) :: icenter
    real, intent(in) ::decay
    integer:: i
    do concurrent(i=1:size(x))
        x(i) = exp(-decay * (i-icenter)**2)
    end do 
end subroutine  





end program tsunami 