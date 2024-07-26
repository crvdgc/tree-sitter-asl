func main () => integer
begin
  var x = 1;
  assert x as integer == x;
  assert x as integer + x as integer as integer == x + x;
  assert x as integer + x as integer as integer == x + x as boolean;
  // failed
  // assert x as integer + x as integer as integer == x + x as integer as boolean;
  return 0;
end
