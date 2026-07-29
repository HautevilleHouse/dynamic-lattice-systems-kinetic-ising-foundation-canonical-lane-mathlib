import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean.LatticeSpinDomain

namespace HautevilleHouse
namespace DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean

structure KineticIsingPhaseTransition (L : LatticeSpinDomain) where
  criticalTemperature : ℝ
  orderParameter : (L.siteType → ℤ) → ℝ
  spontaneousMagnetizationBelowTc : Prop
  vanishingMagnetizationAboveTc : Prop

structure KineticIsingPhaseTransitionEvidence {L : LatticeSpinDomain} (P : KineticIsingPhaseTransition L) where
  spontaneousMagnetizationBelowTcClosed : P.spontaneousMagnetizationBelowTc
  vanishingMagnetizationAboveTcClosed : P.vanishingMagnetizationAboveTc

def KineticIsingPhaseTransitionClosed {L : LatticeSpinDomain} (P : KineticIsingPhaseTransition L) : Prop :=
  P.spontaneousMagnetizationBelowTc ∧ P.vanishingMagnetizationAboveTc

theorem kinetic_ising_phase_transition_closed_from_evidence {L : LatticeSpinDomain} (P : KineticIsingPhaseTransition L) (E : KineticIsingPhaseTransitionEvidence P) :
    KineticIsingPhaseTransitionClosed P := by
  exact And.intro E.spontaneousMagnetizationBelowTcClosed E.vanishingMagnetizationAboveTcClosed

end DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean
end HautevilleHouse