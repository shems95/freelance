//+------------------------------------------------------------------+
//|                                                       Node.mqh    |
//|                        Classe Node                               |
//+------------------------------------------------------------------+
#include "CInterval.mqh"

class Node
  {
public:
   int max;
   CInterval *interval;
   Node *left;
   Node *right;

   // Costruttore
   Node(CInterval *interval)
     : interval(interval), max(interval.to), left(NULL), right(NULL)
   {}
  };
