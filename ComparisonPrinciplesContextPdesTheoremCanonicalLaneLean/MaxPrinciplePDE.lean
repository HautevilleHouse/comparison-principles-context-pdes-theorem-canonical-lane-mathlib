import ComparisonPrinciplesContextPdesTheoremCanonicalLaneLean.PDEBackground

namespace HautevilleHouse
namespace ComparisonPrinciplesContextPdesTheoremCanonicalLaneLean

structure MaxPrinciplePDEPackage {G : PDEBackgroundPackage} where
  solutionSpace : Type u
  comparisonInequality : Prop
  boundaryCondition : Prop
  extremumPrinciple : Prop

structure MaxPrinciplePDEEvidence {G : PDEBackgroundPackage} (M : MaxPrinciplePDEPackage G) where
  comparisonInequalityClosed : M.comparisonInequality
  boundaryConditionClosed : M.boundaryCondition
  extremumPrincipleClosed : M.extremumPrinciple

def MaxPrinciplePDEClosed {G : PDEBackgroundPackage} (M : MaxPrinciplePDEPackage G) : Prop :=
  M.comparisonInequality ∧ M.boundaryCondition ∧ M.extremumPrinciple

theorem max_principle_pde_closed_from_evidence
    {G : PDEBackgroundPackage} (M : MaxPrinciplePDEPackage G) (E : MaxPrinciplePDEEvidence M) :
    MaxPrinciplePDEClosed M := by
  exact And.intro E.comparisonInequalityClosed (And.intro E.boundaryConditionClosed E.extremumPrincipleClosed)

end ComparisonPrinciplesContextPdesTheoremCanonicalLaneLean
end HautevilleHouse
