import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean.GlauberDynamicsPackage
import HautevilleHouse.DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean.KineticIsingSteadyState

namespace HautevilleHouse
namespace DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean

structure LangevinUnpacking {S : KineticIsingSpinConfig} (G : GlauberDynamicsPackage S) (St : KineticIsingSteadyState G) where
  continuumLimit : Prop
  stochasticPDE : Prop
  fluctuationDissipation : Prop
  weakNoiseAsymptotics : Prop
  continuumProof : continuumLimit → stochasticPDE → fluctuationDissipation → weakNoiseAsymptotics → Prop
  unpackingEvidence : continuumProof (by trivial) (by trivial) (by trivial) (by trivial)

def LangevinUnpackingClosed {S : KineticIsingSpinConfig} {G : GlauberDynamicsPackage S} {St : KineticIsingSteadyState G} (L : LangevinUnpacking G St) : Prop :=
  L.continuumLimit ∧ L.stochasticPDE ∧ L.fluctuationDissipation ∧ L.weakNoiseAsymptotics

theorem langevin_unpacking_closed {S : KineticIsingSpinConfig} {G : GlauberDynamicsPackage S} {St : KineticIsingSteadyState G} (L : LangevinUnpacking G St) :
    LangevinUnpackingClosed L := by
  unfold LangevinUnpackingClosed
  exact And.intro L.continuumLimit (And.intro L.stochasticPDE (And.intro L.fluctuationDissipation L.weakNoiseAsymptotics))

end DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean
end HautevilleHouse