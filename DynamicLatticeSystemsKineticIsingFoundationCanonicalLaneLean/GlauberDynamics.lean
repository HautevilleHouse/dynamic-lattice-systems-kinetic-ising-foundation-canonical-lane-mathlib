import canonicalLaneMathlib.AdmissibleClass
import DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean.KineticIsingSpinFlip

namespace HautevilleHouse
namespace DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean

structure GlauberDynamicsPackage where
  transitionMatrix : Type u
  invariantMeasure : Prop
  reversibility : Prop
  mixingTime : Prop
  spinFlipKernel : SpinFlipKernel

def glauberDynamicsClosed (G : GlauberDynamicsPackage) : Prop :=
  G.invariantMeasure ∧ G.reversibility ∧ G.mixingTime

theorem glauber_dynamics_closed_iff (G : GlauberDynamicsPackage) :
  glauberDynamicsClosed G := by
  exact And.intro G.invariantMeasure (And.intro G.reversibility G.mixingTime)

end DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean
end HautevilleHouse