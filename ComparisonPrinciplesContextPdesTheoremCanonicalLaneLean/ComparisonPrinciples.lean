import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComparisonPrinciplesContextPdesTheoremCanonicalLaneLean

structure ComparisonPackage where
  coefficientFunction : Type u
  maximumPrincipleApplicable : Prop
  comparisonInequality : Prop
  boundaryControl : Prop
  gradientEstimate : Prop

structure ComparisonEvidence (C : ComparisonPackage) where
  maximumPrincipleApplicableClosed : C.maximumPrincipleApplicable
  comparisonInequalityClosed : C.comparisonInequality
  boundaryControlClosed : C.boundaryControl
  gradientEstimateClosed : C.gradientEstimate

def ComparisonClosed (C : ComparisonPackage) : Prop :=
  C.maximumPrincipleApplicable ∧ C.comparisonInequality ∧
  C.boundaryControl ∧ C.gradientEstimate

theorem comparison_closed_from_evidence (C : ComparisonPackage)
    (E : ComparisonEvidence C) : ComparisonClosed C := by
  exact And.intro E.maximumPrincipleApplicableClosed
    (And.intro E.comparisonInequalityClosed
      (And.intro E.boundaryControlClosed E.gradientEstimateClosed))

end ComparisonPrinciplesContextPdesTheoremCanonicalLaneLean
end HautevilleHouse