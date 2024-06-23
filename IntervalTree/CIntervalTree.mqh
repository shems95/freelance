
//+------------------------------------------------------------------+
//|                                                   CIntervalTree.mqh|
//|                        Classe Interval Tree                      |
//+------------------------------------------------------------------+
#include <Arrays\ArrayObj.mqh>
#include "Node.mqh"

class CIntervalTree
  {
private:
   Node *root;

   // Metodo per inserire un intervallo nell'albero
   void Insert(Node *&root, CInterval *interval)
     {
      if(root == NULL)
        {
         root = new Node(interval);
        }
      else if(interval.from < root.interval.from)
        {
         Insert(root.left, interval);
         if(root.left.max > root.max)
            root.max = root.left.max;
        }
      else
        {
         Insert(root.right, interval);
         if(root.right.max > root.max)
            root.max = root.right.max;
        }
     }

   // Metodo per cercare gli intervalli che intersecano un punto
   void Search(Node *root, int point, CArrayObj &result)
     {
      if(root == NULL)
         return;
      if(root.interval.Contains(point))
         result.Add(root.interval);
      if(root.left != NULL && root.left.max >= point)
         Search(root.left, point, result);
      Search(root.right, point, result);
     }

public:
   // Costruttore
   CIntervalTree() : root(NULL) {}

   // Metodo per aggiungere un intervallo
   void AddInterval(CInterval *interval)
     {
      Insert(root, interval);
     }

   // Metodo per cercare intervalli che intersecano un punto
   CArrayObj* SearchIntervals(int point)
     {
      CArrayObj* result = new CArrayObj(); // Initialize the result object
      Search(root, point, *result);
      return result;
     }
  };

