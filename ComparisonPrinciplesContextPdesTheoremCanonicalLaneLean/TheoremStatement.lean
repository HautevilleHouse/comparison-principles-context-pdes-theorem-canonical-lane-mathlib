import canonicalLaneMathlib.AdmissibleClass

/-!
# Theorem Statement Layer
-/

namespace HautevilleHouse
namespace ComparisonPrinciplesContextPdesTheoremCanonicalLaneLean

structure ComparisonAdmittedObject where
  domain : Type
  pdeOperator : Type
  comparisonPrinciple : Prop
  conclusion : comparisonPrinciple

structure ComparisonAdmittedObjectEvidence where
  object : ComparisonAdmittedObject
  comparisonPrincipleClosed : object.comparisonPrinciple

def ComparisonWitnessClosed (O : ComparisonAdmittedObject) : Prop :=
  O.comparisonPrinciple

end ComparisonPrinciplesContextPdesTheoremCanonicalLaneLean
end HautevilleHouse