-- Switch state
OFF = 0;
ON = 1;

-- Reverser State (can also be OFF)
REVERSE = 1;
NEUTRAL = 2;
FORWARD = 3;

-- Brake Positions
RUNNING = 0.2;
FIRST_APP = 0.4;
FULL_SERVICE = 0.68;
EMERGENCY = 0.82;
SHUTDOWN = 1;

-- Wiper State (can also be OFF)
SLOW = 1;
FAST = -1;

function OnEvent(event)
    _G["OnEvent" .. event]();
end

function OnEventLoad()
   SysCall("PlayerEngine:SetControlValue", "Cab1MasterKey",            0, ON);
   SysCall("PlayerEngine:SetControlValue", "Cab1HeadlightSwitch",      0, ON);
   SysCall("PlayerEngine:SetControlValue", "Cab1RouteIndicatorSwitch", 0, ON);
   SysCall("PlayerEngine:SetControlValue", "Cab1InstrumentLights",     0, ON);
   SysCall("PlayerEngine:SetControlValue", "Cab1TaillightASwitch",     0, OFF);
   SysCall("PlayerEngine:SetControlValue", "Cab1TaillightBSwitch",     0, OFF);
   SysCall("PlayerEngine:SetControlValue", "Cab1AWSChangeEndSwitch",   0, ON);
   SysCall("PlayerEngine:SetControlValue", "Cab1LeftWiperControl",     0, OFF);
   SysCall("PlayerEngine:SetControlValue", "Cab1VirtualReverser",      0, NEUTRAL);
   SysCall("PlayerEngine:SetControlValue", "DRA",                      0, ON);
   SysCall("PlayerEngine:SetControlValue", "VirtualBrake",             0, FULL_SERVICE);

   --[[ 
    Cancels the AWS. This must be called if:
        1) The master key is ON
        2) The reverser is not in in the OFF position.
    ]]
   SysCall("PlayerEngine:SetControlValue", "MyAWSReset", 0, 1);            
end
