import canonicalLaneMathlib.AdmissibleClass

/-!
# Global Comparison Theorem Package
-/

namespace HautevilleHouse
namespace ComparisonPrinciplesContextPdesTheoremCanonicalLaneLean

structure GlobalComparisonTheoremPackage where
  globalComparisonResult : Prop
  boundaryConditionHandled : Prop
  uniquenessImplication : Prop
  topologicalConsequence : Prop

structure GlobalComparisonTheoremEvidence (G : GlobalComparisonTheoremPackage) where
  globalComparisonResultClosed : G.globalComparisonResult
  boundaryConditionHandledClosed : G.boundaryConditionHandled
  uniquenessImplicationClosed : G.uniquenessImplication
  topologicalConsequenceClosed : G.topologicalConsequence

def GlobalComparisonTheoremClosed (G : GlobalComparisonTheoremPackage) : Prop :=
  G.globalComparisonResult ∧ G.boundaryConditionHandled ∧
  G.uniquenessImplication ∧ G.topologicalConsequence

theorem global_comparison_theorem_closed_from_evidence
    (G : GlobalComparisonTheoremPackage)
    (E : GlobalComparisonTheoremEvidence G) : GlobalComparisonTheoremClosed G := by
  exact And.intro E.globalComparisonResultClosed
    (And.intro E.boundaryConditionHandledClosed
      (And.intro E.uniquenessImplicationClosed E.topologicalConsequenceClosed))

end ComparisonPrinciplesContextPdesTheoremCanonicalLaneLean
end HautevilleHouse