import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComparisonPrinciplesContextPdesTheoremCanonicalLaneLean

structure MaximumPrinciplePackage {P : ComparisonPrinciplePDEPackage} where
  parabolicMaximumPrinciple : Prop
  ellipticMaximumPrinciple : Prop
  hopfLemma : Prop
  barrierFunctionExistence : Prop
  boundaryPointEstimate : Prop

structure MaximumPrincipleEvidence {P : ComparisonPrinciplePDEPackage} (M : MaximumPrinciplePackage P) where
  parabolicMaximumPrincipleClosed : M.parabolicMaximumPrinciple
  ellipticMaximumPrincipleClosed : M.ellipticMaximumPrinciple
  hopfLemmaClosed : M.hopfLemma
  barrierFunctionExistenceClosed : M.barrierFunctionExistence
  boundaryPointEstimateClosed : M.boundaryPointEstimate

def MaximumPrincipleClosed {P : ComparisonPrinciplePDEPackage} (M : MaximumPrinciplePackage P) : Prop :=
  M.parabolicMaximumPrinciple ∧ M.ellipticMaximumPrinciple ∧ M.hopfLemma ∧ M.barrierFunctionExistence ∧ M.boundaryPointEstimate

theorem maximum_principle_closed_from_evidence
    {P : ComparisonPrinciplePDEPackage} (M : MaximumPrinciplePackage P) (E : MaximumPrincipleEvidence M) :
    MaximumPrincipleClosed M :=
  And.intro E.parabolicMaximumPrincipleClosed
    (And.intro E.ellipticMaximumPrincipleClosed
      (And.intro E.hopfLemmaClosed
        (And.intro E.barrierFunctionExistenceClosed E.boundaryPointEstimateClosed)))

end ComparisonPrinciplesContextPdesTheoremCanonicalLaneLean
end HautevilleHouse