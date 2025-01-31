//+------------------------------------------------------------------+
//|                                                         Main.mq5 |
//|                        Expert Advisor                           |
//+------------------------------------------------------------------+
#include <Trade\Trade.mqh>
#include "CIntervalTree.mqh"

class CTestObject : public CObject
  {
public:
   string name;
   CTestObject(string name) : name(name) {}
  };

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   // Crea l'albero intervallare
   CIntervalTree tree;

   // Crea alcuni oggetti di test
   CTestObject *obj1 = new CTestObject("Object 1");
   CTestObject *obj2 = new CTestObject("Object 2");
   CTestObject *obj3 = new CTestObject("Object 3");
   CTestObject *obj4 = new CTestObject("Object 4");

   // Aggiungi alcuni intervalli
   tree.AddInterval(new CInterval(1, 5, obj1));
   tree.AddInterval(new CInterval(3, 7, obj2));
   tree.AddInterval(new CInterval(6, 10, obj3));
   tree.AddInterval(new CInterval(4, 10,obj4));

   // Cerca gli intervalli che intersecano il punto 4
   CArrayObj result = tree.SearchIntervals(4);

   // Stampa i risultati
   for(int i = 0; i < result.Total(); i++)
     {
      CInterval *interval = (CInterval *)result.At(i);
      Print("Interval from: ", interval.from, " to: ", interval.to, " contains object: ", ((CTestObject* )interval.object).name);
     }

   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+

// 
// In this corrected version, I have changed the creation of `CTestObject` instances to use pointers (`new CTestObject("Object 1")`), which is necessary because the `CInterval` constructor expects a pointer to a `CObject`.
// 
// Additionally, remember to manage the memory properly. In a real-world scenario, you should delete the dynamically allocated objects when they are no longer needed to avoid memory leaks.
// 
