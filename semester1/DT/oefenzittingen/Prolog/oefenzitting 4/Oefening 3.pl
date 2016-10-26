%!esystant


% Example knowledge base
house(5,4).
wall(v,2,3,4).
wall(v,3,0,1).
wall(v,4,0,1).
wall(h,2,3,5).
color(1,1,green).
color(1,2,red).
color(3,1,red).
color(4,0,blue).

wall_in_part(part(XCo1,YCo1,XCo2,YCo2),Wall) :-
	findall(wall(v,XCo,YCo1W,YCo2W), (wall(v,XCo,YCo1W,YCo2W), XCo <  XCo2, XCo > XCo1, YCo2W < YCo2, YCo1W > YCo1), List),
	member(Wall, List).

wall_in_part(part(XCo1,YCo1,XCo2,YCo2),Wall) :-
	findall(wall(h,YCo,XCo1W,XCo2W),(wall(h,YCo,XCo1W,XCo2W), YCo <  YCo2, YCo > YCo1, XCo2W < XCo2, XCo1W > XCo1),List),
	member(Wall,List).

color_in_part(part(XCo1,YCo1,XCo2,YCo2), color(X, Y, Z)) :-
	color(X,Y,Z),	
	XCo1 < X,
	XCo2 > X,
	YCo1 < Y,
	YCo2 > Y.

single_color_present(Part) :-
	color_in_part(Part,_).

part_has_wall(Part) :-
	wall_in_part(Part,_).
