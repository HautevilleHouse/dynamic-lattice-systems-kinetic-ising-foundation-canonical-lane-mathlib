import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean

structure KineticIsingSpinConfig where
  latticeType : Type u
  spinState : latticeType → ℤ
  localField : latticeType → ℝ
  interactionEnergy : latticeType → latticeType → ℝ
  temperature : ℝ
  transverseField : ℝ
  markovGenerator : Prop
  generatorBlocked : markovGenerator

def KineticIsingSpinConfigClosed (S : KineticIsingSpinConfig) : Prop :=
  S.markovGenerator

theorem kinetic_ising_spin_config_closed (S : KineticIsingSpinConfig) :
    KineticIsingSpinConfigClosed S := by
  exact S.generatorBlocked

end DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean
end HautevilleHouse
