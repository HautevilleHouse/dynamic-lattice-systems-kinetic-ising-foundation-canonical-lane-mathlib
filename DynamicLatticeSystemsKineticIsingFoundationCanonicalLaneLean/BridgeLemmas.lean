import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean.KineticIsingAdmissibleClass

namespace HautevilleHouse
namespace DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean

def bridgeClosed (A : KineticIsingAdmissibleClass) : Prop :=
  kineticIsingWitnessClosed A.object

theorem bridge_from_admissible_class (A : KineticIsingAdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean
end HautevilleHouse