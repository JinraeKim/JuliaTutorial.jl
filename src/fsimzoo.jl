# toggle ] and then type command `dev FSimZoo` for simultaneous development of multiple packages

function read_multicopter_property()
    multicopter = FSimZoo.LeeQuadcopter()
    @show multicopter.m
end
