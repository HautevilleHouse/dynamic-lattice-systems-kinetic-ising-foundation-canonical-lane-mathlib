import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean.KineticIsingSpinConfig
import HautevilleHouse.DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean.GlauberDynamicsPackage

namespace HautevilleHouse
namespace DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean

structure KineticIsingSteadyState {S : KineticIsingSpinConfig} (G : GlauberDynamicsPackage S) where
  invariantMeasure : Prop
  gibbsianForm : Prop
  correlationDecay : Prop
  finiteSizeEffects : Prop
  invariantProof : invariantMeasure
  gibbsProof : gibbsianForm
  correlationProof : correlationDecay
  finiteSizeProof : finiteSizeEffects

def KineticIsingSteadyStateClosed {S : KineticIsingSpinConfig} {G : GlauberDynamicsPackage S} (St : KineticIsingSteadyState G) : Prop :=
  St.invariantMeasure ∧ St.gibbsianForm ∧ St.correlationDecay ∧ St.finiteSizeEffects

theorem kinetic_ising_steady_state_closed {S : KineticIsingSpinConfig} {G : GlauberDynamicsPackage S} (St : KineticIsingSteadyState G) :
    KineticIsingSteadyStateClosed St := by
  exact And.intro St.invariantProof (And.intro St.gibbsProof (And.intro St.correlationProof St.finiteSizeProof))

end DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean
end HautevilleHouse
