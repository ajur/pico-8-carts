pico-8 cartridge // http://www.pico-8.com
version 16
__lua__

left,right,up,down,fire1,fire2=0,1,2,3,4,5
black,dark_blue,dark_purple,dark_green,brown,dark_gray,light_gray,white,red,orange,yellow,green,blue,indigo,pink,peach
    =0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15

RND_VAL=-1

function _init()
    cls()

    for x=0,127 do
        pset(x, 127, 15)
    end
end

function _update60()
    if btnp(up) then
        RND_VAL = RND_VAL + 1
    end
    if btnp(down) then
        RND_VAL = RND_VAL - 1
    end
end

function _draw()
    for x = 0,127 do
        for y = 126,0,-1 do
            r = flr(0.5 + rnd(abs(RND_VAL))) * sgn(RND_VAL)
            xx = x + r
            if xx < 0 then xx = xx + 128 end
            cr = flr(0.5 + rnd(1))
            pset(xx, y, max(0, pget(x, y + 1) - cr))
        end
    end

    print("BURN", 60, 60, 15)
end

