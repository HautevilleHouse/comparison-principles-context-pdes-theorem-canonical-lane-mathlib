import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComparisonPrinciplesContextPdesTheoremCanonicalLaneLean

structure DomainContextPackage where
  spaceDimension : ℕ
  pdeType : String
  comparisonPrinciple : Prop
  boundaryCondition : Prop
  initialCondition : Prop
  uniquenessClass : Prop

def domainContextPackageDefault : DomainContextPackage :=
  { spaceDimension := 1
    pdeType := "parabolic"
    comparisonPrinciple := True
    boundaryCondition := True
    initialCondition := True
    uniquenessClass := True
  }

structure DomainContextEvidence (D : DomainContextPackage) where
  spaceDimensionClosed : D.spaceDimension = 1
  pdeTypeClosed : D.pdeType = "parabolic"
  comparisonPrincipleClosed : D.comparisonPrinciple
  boundaryConditionClosed : D.boundaryCondition
  initialConditionClosed : D.initialCondition
  uniquenessClassClosed : D.uniquenessClass

def DomainContextClosed (D : DomainContextPackage) : Prop :=
  D.spaceDimension = 1 ∧ D.pdeType = "parabolic" ∧ D.comparisonPrinciple ∧
  D.boundaryCondition ∧ D.initialCondition ∧ D.uniquenessClass

theorem domain_context_closed_from_evidence (D : DomainContextPackage) (E : DomainContextEvidence D) : DomainContextClosed D :=
  And.intro E.spaceDimensionClosed (And.intro E.pdeTypeClosed
    (And.intro E.comparisonPrincipleClosed (And.intro E.boundaryConditionClosed
      (And.intro E.initialConditionClosed E.uniquenessClassClosed))))

end ComparisonPrinciplesContextPdesTheoremCanonicalLaneLean
end HautevilleHouse