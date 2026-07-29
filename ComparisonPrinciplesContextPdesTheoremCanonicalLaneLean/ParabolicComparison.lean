import canonicalLaneMathlib.AdmissibleClass
import ComparisonPrinciplesContextPdesTheoremCanonicalLaneLean.ComparisonPrincipleDefinition

namespace HautevilleHouse
namespace ComparisonPrinciplesContextPdesTheoremCanonicalLaneLean

structure ParabolicComparisonPackage where
  timeDependentOperator : Prop
  subParabolicSolution : Prop
  superParabolicSolution : Prop
  comparisonPrincipleHolds : Prop
  classicalSolutionExists : Prop

structure ParabolicComparisonEvidence (P : ParabolicComparisonPackage) where
  timeDependentOperatorClosed : P.timeDependentOperator
  subParabolicSolutionClosed : P.subParabolicSolution
  superParabolicSolutionClosed : P.superParabolicSolution
  comparisonPrincipleHoldsClosed : P.comparisonPrincipleHolds
  classicalSolutionExistsClosed : P.classicalSolutionExists

def ParabolicComparisonClosed (P : ParabolicComparisonPackage) : Prop :=
  P.timeDependentOperator ∧ P.subParabolicSolution ∧ P.superParabolicSolution ∧
  P.comparisonPrincipleHolds ∧ P.classicalSolutionExists

theorem parabolic_comparison_closed_from_evidence (P : ParabolicComparisonPackage) (E : ParabolicComparisonEvidence P) :
    ParabolicComparisonClosed P :=
  And.intro E.timeDependentOperatorClosed (And.intro E.subParabolicSolutionClosed
    (And.intro E.superParabolicSolutionClosed (And.intro E.comparisonPrincipleHoldsClosed E.classicalSolutionExistsClosed)))

end ComparisonPrinciplesContextPdesTheoremCanonicalLaneLean
end HautevilleHouse