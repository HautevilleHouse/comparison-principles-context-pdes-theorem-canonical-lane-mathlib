import canonicalLaneMathlib.AdmissibleClass

/-!
# Maximum Principle Application Package
-/

namespace HautevilleHouse
namespace ComparisonPrinciplesContextPdesTheoremCanonicalLaneLean

structure MaximumPrincipleApplicationPackage where
  parabolicMaximumPrinciple : Prop
  barrierFunctionConstruction : Prop
  boundaryHolderRegularity : Prop
  interiorEstimate : Prop

structure MaximumPrincipleApplicationEvidence (M : MaximumPrincipleApplicationPackage) where
  parabolicMaximumPrincipleClosed : M.parabolicMaximumPrinciple
  barrierFunctionConstructionClosed : M.barrierFunctionConstruction
  boundaryHolderRegularityClosed : M.boundaryHolderRegularity
  interiorEstimateClosed : M.interiorEstimate

def MaximumPrincipleApplicationClosed (M : MaximumPrincipleApplicationPackage) : Prop :=
  M.parabolicMaximumPrinciple ∧ M.barrierFunctionConstruction ∧
  M.boundaryHolderRegularity ∧ M.interiorEstimate

theorem maximum_principle_application_closed_from_evidence
    (M : MaximumPrincipleApplicationPackage)
    (E : MaximumPrincipleApplicationEvidence M) : MaximumPrincipleApplicationClosed M := by
  exact And.intro E.parabolicMaximumPrincipleClosed
    (And.intro E.barrierFunctionConstructionClosed
      (And.intro E.boundaryHolderRegularityClosed E.interiorEstimateClosed))

end ComparisonPrinciplesContextPdesTheoremCanonicalLaneLean
end HautevilleHouse