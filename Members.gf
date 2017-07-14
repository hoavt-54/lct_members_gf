abstract Members = {

flags startcat = Statement ;

cat
  Statement ;
  Query ;
  Entity ;
  Attribute ;
  [Attribute] {1} ;
  [Entity] {1} ;
  Condition ;
  Conditions ;
  Property ;
  Value ;
  
fun
  SQuery : Query -> Statement ;

  QShowEverything : [Entity] -> Conditions -> Query ;   -- select * from entities where condition
  
  QShow : [Attribute] -> [Entity] -> Conditions -> Query ;  -- select attributes from entities where condition

  QWhat : Attribute -> Value -> Query ;  -- select a.name from a.table where a.attr = v
  
  QWhichProp : Attribute -> Property -> Query ;  -- select * from a.table where a.attr p

  QHowMany : Attribute -> Value -> Query ;  -- select count(*) from a.table where a.attr = v
  
  QHowManyProp : Attribute -> Property -> Query ;  -- select count(*) from a.table where a.attr p
   
  QWhichBest: Attribute -> Query ; -- select name from tbl where a = (select max(a) from tbl) 
 
  QWhichWorst: Attribute -> Query ;

  QWhoCity: Attribute -> Value -> Query;  

  CsNone : Conditions ;
  CsConditions : Condition -> Conditions ;
  
  CAnd  : Condition -> Condition -> Condition ;
  CProperty : Value -> Property -> Condition ;
  
  PEqual    : Value -> Property ;
  PNotEqual : Value -> Property ;
  POver     : Value -> Property ;
  PUnder    : Value -> Property ;
  PAtLeast  : Value -> Property ;
  PAtMost   : Value -> Property ;

  VAttribute : Attribute -> Value ;  -- attribute
  VQualifiedAttribute : Attribute -> Value ; -- Table.attribute

  VString : String -> Value ;
  VInt : Int -> Value ;
  

  EMember : Entity ;
  AMemberName       : Attribute ;
  AMemberType       : Attribute ;  
  AMemberNationality : Attribute ;
  AMemberAge        : Attribute ;
  AMemberFirstCity : Attribute ;
  AMemberSecondCity : Attribute ;
  AMemberScore : Attribute;




}
