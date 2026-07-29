import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComparisonPrinciplesContextPdesTheoremCanonicalLaneLean

structure ViscositySolutionPackage {P : ComparisonPrinciplePDEPackage} where
  continuousSubsolutionClass : Prop
  continuousSupersolutionClass : Prop
  testFunctionMethod : Prop
  stabilityUnderLimits : Prop
  comparisonForViscositySolutions : Prop

structure ViscositySolutionEvidence {P : ComparisonPrinciplePDEPackage} (V : ViscositySolutionPackage P) where
  continuousSubsolutionClassClosed : V.continuousSubsolutionClass
  continuousSupersolutionClassClosed : V.continuousSupersolutionClass
  testFunctionMethodClosed : V.testFunctionMethod
  stabilityUnderLimitsClosed : V.stabilityUnderLimits
  comparisonForViscositySolutionsClosed : V.comparisonForViscositySolutions

def ViscositySolutionClosed {P : ComparisonPrinciplePDEPackage} (V : ViscositySolutionPackage P) : Prop :=
  V.continuousSubsolutionClass ∧ V.continuousSupersolutionClass ∧ V.testFunctionMethod ∧ V.stabilityUnderLimits ∧ V.comparisonForViscositySolutions

theorem viscosity_solution_closed_from_evidence
    {P : ComparisonPrinciplePDEPackage} (V : ViscositySolutionPackage P) (E : ViscositySolutionEvidence V) :
    ViscositySolutionClosed V :=
  And.intro E.continuousSubsolutionClassClosed
    (And.intro E.continuousSupersolutionClassClosed
      (And.intro E.testFunctionMethodClosed
        (And.intro E.stabilityUnderLimitsClosed E.comparisonForViscositySolutionsClosed)))

end ComparisonPrinciplesContextPdesTheoremCanonicalLaneLean
end HautevilleHouse