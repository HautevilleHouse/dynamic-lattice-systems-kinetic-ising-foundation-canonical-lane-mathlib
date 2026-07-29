import DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean.GlauberDynamics

namespace HautevilleHouse
namespace DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean

structure KineticIsingSpace where
  carrier : Type
  lattice : carrier → carrier

def KineticIsingAdmittedObject where
  space : KineticIsingSpace
  latticeType : Prop
  glauberDynamics : Prop
  detailedBalance : Prop
  ergodic : Prop
  mixingTimeFinite : Prop
  conclusion : mixingTimeFinite

def KineticIsingWitnessClosed (O : KineticIsingAdmittedObject) : Prop :=
  O.mixingTimeFinite

end DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean
end HautevilleHouse