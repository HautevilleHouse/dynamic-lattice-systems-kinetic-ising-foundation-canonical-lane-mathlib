import canonicalLaneMathlib.AdmissibleClass
import LatticeConfig

namespace HautevilleHouse
namespace DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean

structure GlauberRate where
  beta : ℝ
  h : ℤ
  rate : T → ℝ
  detailedBalance : Prop

structure KineticIsingPackage {T : Type} (L : DynamicLattice T) where
  temperature : ℝ
  externalField : ℤ
  glauberRate : GlauberRate
  masterEquation : Prop
  ergodicity : Prop
  stationaryDistribution : Prop
  equilibriumCorrelation : Prop

structure KineticIsingEvidence {T : Type} {L : DynamicLattice T} (K : KineticIsingPackage L) where
  masterEquationClosed : K.masterEquation
  ergodicityClosed : K.ergodicity
  stationaryDistributionClosed : K.stationaryDistribution
  equilibriumCorrelationClosed : K.equilibriumCorrelation

def KineticIsingClosed {T : Type} {L : DynamicLattice T} (K : KineticIsingPackage L) : Prop :=
  K.masterEquation ∧ K.ergodicity ∧ K.stationaryDistribution ∧ K.equilibriumCorrelation

theorem kinetic_ising_closed_from_evidence
    {T : Type} {L : DynamicLattice T} (K : KineticIsingPackage L) (E : KineticIsingEvidence K) :
    KineticIsingClosed K := by
  exact And.intro E.masterEquationClosed
    (And.intro E.ergodicityClosed
      (And.intro E.stationaryDistributionClosed E.equilibriumCorrelationClosed))

end DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean
end HautevilleHouse