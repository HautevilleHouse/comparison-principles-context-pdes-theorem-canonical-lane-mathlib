import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComparisonPrinciplesContextPdesTheoremCanonicalLaneLean

structure BarrierPackage where
  barrierClass : Type u
  subsolutionProperty : Prop
  supersolutionProperty : Prop
  existenceOnDomain : Prop

structure BarrierEvidence (B : BarrierPackage) where
  subsolutionPropertyClosed : B.subsolutionProperty
  supersolutionPropertyClosed : B.supersolutionProperty
  existenceOnDomainClosed : B.existenceOnDomain

def BarrierClosed (B : BarrierPackage) : Prop :=
  B.subsolutionProperty ∧ B.supersolutionProperty ∧ B.existenceOnDomain

theorem barrier_closed_from_evidence (B : BarrierPackage)
    (E : BarrierEvidence B) : BarrierClosed B := by
  exact And.intro E.subsolutionPropertyClosed
    (And.intro E.supersolutionPropertyClosed E.existenceOnDomainClosed)

end ComparisonPrinciplesContextPdesTheoremCanonicalLaneLean
end HautevilleHouse