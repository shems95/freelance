//+------------------------------------------------------------------+
//|                                                      CInterval.mqh|
//|                        Classe Interval                          |
//+------------------------------------------------------------------+
#include <Arrays\ArrayObj.mqh>
class CInterval : public CObject
  {
public:
   int from;
   int to;
   CObject* object;

   // Costruttore
   CInterval(int from, int to, CObject* object)
     : from(from), to(to), object(object)
   {}

   // Metodo per verificare se un punto è all'interno dell'intervallo
   bool Contains(int point)
     {
      return point >= from && point <= to;
     }

   // Metodo per verificare se un altro intervallo si sovrappone a questo
   bool Overlaps(CInterval &other)
     {
      return from <= other.to && to >= other.from;
     }
  };
