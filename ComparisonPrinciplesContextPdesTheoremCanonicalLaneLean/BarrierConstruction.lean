import canonicalLaneMathlib.AdmissibleClass
import ComparisonPrinciplesContextPdesTheoremCanonicalLaneLean.ComparisonPrincipleDefinition

namespace HautevilleHouse
namespace ComparisonPrinciplesContextPdesTheoremCanonicalLaneLean

structure BarrierConstructionPackage where
  barrierFunction : Type
  barrierSubSolution : Prop
  boundaryComparison : Prop
  interiorEstimate : Prop
  barrierAchieved : Prop

structure BarrierConstructionEvidence (B : BarrierConstructionPackage) where
  barrierSubSolutionClosed : B.barrierSubSolution
  boundaryComparisonClosed : B.boundaryComparison
  interiorEstimateClosed : B.interiorEstimate
  barrierAchievedClosed : B.barrierAchieved

def BarrierConstructionClosed (B : BarrierConstructionPackage) : Prop :=
  B.barrierSubSolution ∧ B.boundaryComparison ∧ B.interiorEstimate ∧ B.barrierAchieved

theorem barrier_construction_closed_from_evidence (B : BarrierConstructionPackage) (E : BarrierConstructionEvidence B) :
    BarrierConstructionClosed B :=
  And.intro E.barrierSubSolutionClosed (And.intro E.boundaryComparisonClosed
    (And.intro E.interiorEstimateClosed E.barrierAchievedClosed))

end ComparisonPrinciplesContextPdesTheoremCanonicalLaneLean
end HautevilleHouse