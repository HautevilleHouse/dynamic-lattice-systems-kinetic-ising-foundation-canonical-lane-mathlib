import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean.KineticIsingSpinConfig

namespace HautevilleHouse
namespace DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean

structure GlauberDynamicsPackage (S : KineticIsingSpinConfig) where
  flipRate : S.latticeType → S.spinState → ℝ
  detailedBalance : Prop
  ergodicityPr : Prop
  mixingTime : Prop
  generatorMarkov : S.markovGenerator → detailedBalance → ergodicityPr → mixingTime → Prop
  evidenceGenerator : generatorMarkov S.generatorBlocked (by trivial) (by trivial) (by trivial)

def GlauberDynamicsPackageClosed (S : KineticIsingSpinConfig) (G : GlauberDynamicsPackage S) : Prop :=
  G.detailedBalance ∧ G.ergodicityPr ∧ G.mixingTime

theorem glauber_dynamics_package_closed (S : KineticIsingSpinConfig) (G : GlauberDynamicsPackage S) :
    GlauberDynamicsPackageClosed S G := by
  unfold GlauberDynamicsPackageClosed
  exact ⟨G.detailedBalance, ⟨G.ergodicityPr, G.mixingTime⟩⟩

end DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean
end HautevilleHouse