type Pair of (integer, boolean);

type T of array [3] of real;
type Coord of enumeration { CX, CY, CZ };
type PointArray of array [Coord] of real;

type PointRecord of record
  { x : real, y : real, z : real };

func foo (x: bits(4) { [3:2] A, [1] B }) => bits(4) { [3:2] A, [1] B }
begin
  return x;
end

func bar{N}(x: bits(N)) => bit
begin
    return x[0];
end


func f (x : integer) => integer
begin
  let y = x + 1;
  return y;
end

func main () => integer
begin
  let p = (0, FALSE);

  var t1 : T; var t2 : PointArray;
  assert (t1[0] == t2[CX]);

  let o = PointRecord { x=0.0, y=0.0, z=0.0 };
  assert (t2[CZ] == o.z);

  var CW = CZ;
  assert t2[CW] == o.z;

  return 0;
end
