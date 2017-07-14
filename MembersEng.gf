concrete MembersEng of Members = open SyntaxEng, (P = ParadigmsEng), SymbolicEng, LexiconEng in {

lincat
  Statement = Text ;
  Query = Utt ;
  Entity = CN ;
  Attribute = {tbl : CN ; attr : CN} ;
  [Attribute] = NP ;
  [Entity] = NP ;
  Condition = S ;
  Conditions = Adv ;
  Property = Adv ;
  Value = NP ;
  
lin
  high_A = P.mkA "high";
  live_V2 = P.mkV2 "live";
  SQuery q = lin Text q | mkText q ;
  

  QWhoCity a v = mkUtt (mkQS (mkQCl who_IP (mkVP (mkVP (P.mkV2 "live") (mkNP theSg_Det a.attr)) (mkAdv  in_Prep v )) ));
  
  QShow as es c =
    mkUtt (mkImp (mkVP (P.mkV2 "show") (mkNP (mkNP as (mkAdv possess_Prep (mkNP all_Predet es))) c))) ; 

  QShowEverything es c =
    mkUtt (mkImp (mkVP (P.mkV2 "show") (mkNP everything_NP (mkAdv (P.mkPrep "about") (mkNP all_Predet (mkNP es c)))))) ; 

  QWhat a v = mkUtt (mkQS (mkQCl what_IP (mkNP (mkNP the_Det a.attr) (mkAdv possess_Prep v)))) ;
  QWhichProp a p = mkUtt (mkQS (mkQCl (mkIP whichPl_IDet a.tbl) have_V2 (mkNP (mkNP a_Det a.attr) p))) ;
  
  QHowMany a v = mkUtt (mkQS (mkQCl (mkIP how8many_IDet a.tbl) have_V2 (mkNP v (mkAdv (P.mkPrep "as") (mkNP a.attr))))) ; 
  QHowManyProp a p = mkUtt (mkQS (mkQCl (mkIP how8many_IDet a.tbl) have_V2 (mkNP (mkNP a_Det a.attr) p))) ;
  
  QWhichBest a = mkUtt (mkQS (mkQCl (mkIP whichPl_IDet a.tbl) have_V2 (mkNP the_Quant (mkCN (mkAP (mkOrd (P.mkA "high"))) a.attr) ) ) )  ;
  QWhichWorst a = mkUtt (mkQS (mkQCl (mkIP whichPl_IDet a.tbl) have_V2 (mkNP the_Quant (mkCN (mkAP (mkOrd (P.mkA "low"))) a.attr) ) ) )  ;
  

  CsNone = P.mkAdv "" ;
  CsConditions c = mkAdv where_Subj c ;
  
  CAnd c d =  mkS and_Conj c d ;
  CProperty v p = mkS (mkCl v p) ;

  PEqual v = mkAdv (P.mkPrep "") v ;
  PNotEqual v = mkAdv (P.mkPrep "not") v ;
  POver v = mkAdv (P.mkPrep "over") v ;
  PUnder v = mkAdv (P.mkPrep "under") v ;
  PAtLeast v = mkAdv (P.mkPrep "at least") v ;
  PAtMost v = mkAdv (P.mkPrep "at most") v ;
  --high_A = mkA "high";
  
  VAttribute a = mkNP the_Det a.attr ;
  VQualifiedAttribute a = mkNP the_Det (mkCN a.tbl (mkNP a.attr)) ;

  VString s = symb s ;
  VInt s = symb s ;

  BaseAttribute a = mkNP thePl_Det a.attr ;
  ConsAttribute a as = mkNP and_Conj (mkNP thePl_Det a.attr) as ;

  BaseEntity a = mkNP aPl_Det a ;
  ConsEntity a as = mkNP and_Conj (mkNP aPl_Det a) as ;



  EMember           =  mkCN (P.mkN "member") ;
  AMemberName       =  mkAttribute "member" "name" ;
  AMemberType       =  mkAttribute "member" "type" ;
  AMemberNationality = mkAttribute "member" "nationality" ;
  AMemberAge        =  mkAttribute "member" "age" ;
  AMemberFirstCity  =  mkAttribute "member" "first" "city" ;
  AMemberSecondCity =  mkAttribute "member" "second" "city";
  AMemberScore      =  mkAttribute "member" "score";    




oper
  
    mkAttribute = overload{  
        mkAttribute : Str -> Str -> Attribute
            =  \e,a -> lin Attribute {attr = mkCN (P.mkN a) ; tbl = mkCN (P.mkN e)} ;

        mkAttribute : Str -> Str -> Str -> Attribute
            =  \e,a1,a2 -> lin Attribute {attr = mkCN (P.mkA a1)(P.mkN a2) ; tbl = mkCN (P.mkN e)} ;
    };


  where_Subj = lin Subj {s = "such that"} | lin Subj {s = "where"}; 
  
}
