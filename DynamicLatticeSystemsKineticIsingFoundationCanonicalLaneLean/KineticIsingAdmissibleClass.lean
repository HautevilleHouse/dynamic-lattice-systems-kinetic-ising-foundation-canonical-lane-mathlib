import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean.KineticIsingLattice
import HautevilleHouse.DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean.GlauberDynamics
import HautevilleHouse.DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean.KramersWannierDuality

namespace HautevilleHouse
namespace DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean

structure KineticIsingAdmittedObject where
  lattice : TwoDimensionalSquareLattice
  dynamics : GlauberDynamicsPackage lattice
  duality : KramersWannierDualityPackage lattice
  glauberClosed : GlauberDynamicsClosed dynamics
  dualityClosed : KramersWannierDualityClosed duality
  conclusion : glauberClosed ∧ dualityClosed

structure KineticIsingAdmissibleClass where
  object : KineticIsingAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def kineticIsingWitnessClosed (O : KineticIsingAdmittedObject) : Prop :=
  O.glauberClosed ∧ O.dualityClosed

end DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean
end HautevilleHouse