pico-8 cartridge // http://www.pico-8.com
version 14
__lua__
function _init()
 fort = {x = 60, y = 50}
	bullets = {}
	enemies = {}
	t = 0
end

function fire (i,sprite,dix,diy)
 local	bullet = {
		sp = sprite, 
		x  = fort.x,
		y  = fort.y, 
		dx = dix,
		dy = diy,
		dire = i
	}
	add(bullets,bullet)
end

function spawn (sprite,sx,sy,dix,diy)
	local enemy = {
		sp = sprite,
		x  = sx,
		y  = sy,
		dx = dix,
		dy = diy
		}
	add(enemies,enemy)
end

function _update()
	t += 1
-- bullet  control
		for bullet in all(bullets) do
				bullet.x += bullet.dx
				bullet.y += bullet.dy
				if bullet.x < 0 or bullet.x > 128 or bullet.y < 0 or bullet.y > 128 then
					del(bullets,bullet)
				end
		end

  if btnp(0) then fire(0,22,-3,0) end
		if btnp(1) then fire(1,19,3,0) end
		if btnp(2) then fire(2,20,0,-3) end
		if btnp(3) then fire(3,21,0,3) end
-- enemy spawn 
	for enemy in all(enemies) do
		enemy.x += enemy.dx
		enemy.y += enemy.dy
		if enemy.x > fort.x then
			del(enemies,enemy)
		end
	end
		if t%100 == 0 then spawn(14,0,fort.y,3,0) end
	
end

function _draw() 
	cls()
	map(0,0,0,0,17,16)
	for bullet in all(bullets) do
		spr(bullet.sp,bullet.x,bullet.y)
	end
	for enemy in all(enemies) do
		spr(enemy.sp,enemy.x,enemy.y)
	end
end



	
__gfx__
00000000000000000000000000000000000000000000000000000000000007007000000700000070000000000000000000000000000000000000000000000000
0000000000000000000000000070007000077000007000070700007000000000070000700007000000bbbb000055550000111100099009900000000002022020
0088777700000000000000000000000000777700077700000000000007000000007777000077700000b00b00005005000110011000099000000ddd0000200200
008887777000000000000000000000000777777077777000000700000000000000777700077777000b0000b000055000001001000090000000d0d0d000022000
000000777777777777700000070000000777777007770000000000000700070000777700777777700bbbbbb000500500000110000009900000d0d0d000200200
00000071111111111117000000000000007777000070000007000000000000000077770007777700b0b00b0b050000500011110009900990000ddd0002000020
00000071a11a11a11a177000000007000007700000000070000007000000000007000070007770000b0bb0b000000000000000000000000000d000d000000000
00000071111111111117000000000000000000000000000000000000007000007000000700070000000000000000000000000000000000000000000000000000
00000077777777777770000000000000000000000000000000000000000000000000000000000000044444400000000000000000000000000000000000000000
00888777700000000000000000000000000000000000000000000000000000000000000000000000404004040033330000222200055005500000000000808000
00887777000000000000000000000000000aa000000550000000000000000000000000000000000004044040003003000220022000055000000ddd0008080800
00000000000000000000000000555a00000550000005500000a555000000000000000000000000000040040000033000002002000050050000d0d0d080080080
00000000000000000000000000555a00000550000005500000a555000000000000000000000000000400004030300303020220200005500000d0d0d080808080
0000000000000000000000000000000000055000000aa0000000000000000000000000000000000000400400030000300020020005500550000ddd0008080800
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d0d0d000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000cccccccccccccccc9999999911111111111161116666111111111bbb
000dd000000dd000000dd000000dd0000000000000000055500000000000000000000000cccccccccccccccc99999999111111111116661166611111bbb11bbb
00dccd0000d00d0000d00d0000d000000000000000000058500000000000000000000000cccccccccccccccc99999999111111111166666166111111bbb11bbb
0dccccd00dccccd00d0000d00d0000d00000000000000058500000000000000000000000cccccccccccccccc99999999111111111116661161111111bbb11141
00dccd0000dccd0000dccd0000d00d000000000000000058500000000000000000000000cccccccccccccccc9999999911111111111161111111111114111141
000dd000000dd000000dd0000000d0000000000000000055500000000000000000000000bbbbbbbbbbbbbbbb4444444499999999111111111111111134333343
000000000000000000000000000000000000000000000005000000000000000000000000bbbbbbbbbbbbbbbb4444444499999999111111111111111133333333
000000000000000000000000000000000000000000000005000000000000000000000000bbbbbbbbbbbbbbbb4444444499999999111111111111111133333333
00000000000000000000000000000000000000000000555555500000000000000000000000000000111111113333333300000000dddd77777777dddd77777777
00000000000000000000000000000000000000000000000500000000000000000000000000000000111111113333333300000000ddddd777777ddddd77777777
00000000000000000000000000000000000000000000000500000000000000000000000000000000111111113333333300000000dddddd7777dddddd77777777
00000000000000000000000000000000000000000000055555000000000000000000000000000000111111113333333300000000ddddddd77ddddddd66666666
00000000000000000000000000000000000000000000050005000000000000000000000000000000111111113333333355555555dddddddddddddddd66666666
00000000000000000000000000000000000000000000050005000000000000000000000000000000333333333333333355555555dddddddddddddddd66666666
00000000000000000000000000000000000000000000000000000000000000000000000000000000333333333333333355555555dddddddddddddddd66666666
00000000000000000000000000000000000000000000000000000000000000000000000000000000333333333333333355555555dddddddddddddddd66666666
000000004444444444444444bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb000000000000000000000000
000000004555555555555554bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb000000000000000000000000
000000004554444444444554bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb333333bbbbbbbbbbbbbbbbbbbbb000000000000000000000000
000000004545000000005454bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb333333bbbbbbbbbbb333333bbbbbbbbbbbbbbbbbbbbb000000000000000000000000
000000004540500000050454bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb333333bbbbbbbbbbb333333bbbbbbbbbbbbbbbbbbbbb000000000000000000000000
000000004540055555500454bbbbbbbbbbbbbbbbbbbbbb3333bbbbbbbbbb333333bbbbbbbbbbb333333bbbbbbbbb333333333bbb000000000000000000000000
000000004540054444500454bbbbbbbbbbbbbbbbbbbbbb3333bbbbbbbbbb333333bbbbbbbbbbb333333bbbbbbbbb33333f333bbb000000000000000000000000
000000004540054444500454bbbbbbbbbbbbbbbbbbbbbb3333bbbbbbbbbb333333bbbbbbbbbbb333333bbbbbbbbb333333333bbb000000000000000000000000
000000004540054444500454bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb44bbbbbbbbbbbbb333333bbbbbbbbb333333333bbb000000000000000000000000
000000004540054444500454bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb44bbbbbbbbbbbbb333333bbbbbbbbb333333333bbb000000000000000000000000
000000004540055555500454bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb44bbbbbbbbbbbbbbb44bbbbbbbbbbbbbbbbbbbbbbb000000000000000000000000
000000004540500000050454bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb44bbbbbbbbbbbbbbb44bbbbbbbbbbbbbbbbbbbbbbb000000000000000000000000
000000004545000000005454bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb44bbbbbbbbbbbbbbb44bbbbbbbbbbbbbbbbbbbbbbb000000000000000000000000
000000004544444444444554bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb44bbbbbbbbbbbbbbbbbbbbbbb000000000000000000000000
000000004555555555555554bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb44bbbbbbbbbbbbbbbbbbbbbbb000000000000000000000000
000000004444444444444444bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000fd77e5d10acf8c6e8641d0feaddf2180d52e62d00000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55500055550555505550005555055500055000555055550000000000000000000000000000000000000000000000000000000000000000000000000000000000
50050050000500005005005000050050500505000050000000000000000000000000000000000000000000000000000000000000000000000000000000000000
50005050000500005005005000050050500505000050000000000000000000000000000000000000000000000000000000000000000000000000000000000000
50005055500555005550005555055500555505000055500000000000000000000000000000000000000000000000000000000000000000000000000000000000
50005050000500005000000005050000500505000050000000000000000000000000000000000000000000000000000000000000000000000000000000000000
50050050000500005000000005050000500505000050000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55500055550555505000005555050000500500555055550000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000700000000000000000000000000000000000000000000000000000000000000000000007000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000007000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000007000000000000000000000000000000000000000000000000000000000700000000000000000000000000000000000
00000000000000000000000000000000077700000000000000000000000000000007000000000000070000000000000000000000000000000000000000007000
00000000000700000000000070000000007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00070000000000000000000000000700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000007000000000000000000000000000000000000000000000000000000070000000000000
00000000000000000000007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000007000000000000000000000000000000000000000000000000700000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000700000000000000000000000000000000000000000000000000000
00000000007000000000000000000000000000000000000000000000000000000007000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000700000000000000000000070000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000700000000777000000000000000000000
00000000000000000070000000700000000000000000000007000000000000000000000000000000000000000000000000000000070000000000000000000000
00000000000000000000000000000000000000000000000077700000000000000000000000000000000000000000000000000000000000000070000000000000
00000000000000000000000000000000000000000000000007000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000700000000000000000700000000000000000000000000000000000000000000000000000000000000000070000
00000700000000000000000000000000000000000000000000000000000000000000000000000700000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000b00070000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000b0bb0b000007000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000700000000000000000000000070000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000070000000000000000000000000000000000000000000000000000000000000
00000000000007000000000000000000000000000000000000070000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000070000000000000700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007000000
00000000000000000000000070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000bbbb00000000000000000000007000007000000b000000b00000000000000000000000000000
0000000000000000000000000000000000000000000000000000b00b000070000000000000000000000000000000000000000000000007000007000000000000
000007000000000000000000000000000000000000000000000b0000b00000000000000000000000000000007000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000bbbbbb00000000000000000000000000000000000000000000000000000000000000000000000

__gff__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
4343434343434343434347484343434300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4347484343434343434357584343434300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
435758434b4c4343434343434b4c434300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
434343435b5c4343444343435b5c434300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
43434343434343535443434343494a4300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
43434343434343434343434343595a4300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4343434443444341424343454643434300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4343535453544351524343555643434300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4343434343434343434343434343434300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
43444b4c4344434443444344434b4c4400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
53545b5c5354494a53545354535b5c5400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
434443444344595a434443444748434400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
53494a5453545354535453545758535400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
43595a44434443444344434443444344eaddf2180d52e62d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5354535453545354535453545354535400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
8787c0c1c2c3c0c1c2c387878787878700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
8787d0d1d2d3d0d1d2d387878787878700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
8787e0e1e2e3e0e1e2e387878787878700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
8787f0f1f2f3f0f1f2f387878787878700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
8787c0c1c2c3c0c1c2c387878787878700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
8787d0d1d2d3d0d1d2d387878787878700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
8787e0e1e2e3e0e1e2e387878787878700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
8787f0f1f2f3f0f1f2f387878787878700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
8787878787878787878787878787878700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
8787878787878787878787878787878700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
8787878787878787878787878787878700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
8787878787878787878787878787878700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
8787878787878787878787878787878700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
8787878787878787878787878787878700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000a00001e0503b0501505016050130501d050200502305026050290502e05031050330503a0503a0503a0503a0503a0503a0503a0503a0503805038050380502205022050200501f0501f0501c0501b05018050
000900000f0500f0501105015050180502d050390503c0503e0503d050280502a0503f050340503f0502505024050200501d0501d050170501a05020050230501f050230502a0502c050370503d0503f0503f050
000a00000905000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000fd7725d102cf042e8641d8762dd72180552ee25000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__music__
00 41024344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344

